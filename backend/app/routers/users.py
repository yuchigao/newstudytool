# backend/app/routers/users.py
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from app.modules.common.models import User
from app.schemas.user import UserUpdate, UserResponse
from app.auth import get_current_active_user, get_password_hash
from app.database import get_db

router = APIRouter()

@router.get("/me", response_model=UserResponse)
async def read_user_me(current_user: User = Depends(get_current_active_user)):
    """获取当前登录用户的详细信息"""
    return current_user

@router.put("/me", response_model=UserResponse)
async def update_user_me(
    user_update: UserUpdate,
    current_user: User = Depends(get_current_active_user),
    db: Session = Depends(get_db)
):
    """更新当前登录用户的信息"""
    # 获取当前用户
    user = db.query(User).filter(User.id == current_user.id).first()
    if not user:
        raise HTTPException(status_code=404, detail="用户不存在")

    # 保存当前的邮箱验证状态
    current_email_verified = user.email_verified

    # 更新用户名
    if user_update.username is not None:
        # 检查用户名是否已存在
        existing_user = db.query(User).filter(User.username == user_update.username).first()
        if existing_user and existing_user.id != current_user.id:
            raise HTTPException(status_code=400, detail="用户名已被使用")
        user.username = user_update.username

    # 更新邮箱
    if user_update.email is not None and user_update.email != user.email:
        # 检查邮箱是否已存在
        existing_email = db.query(User).filter(User.email == user_update.email).first()
        if existing_email and existing_email.id != current_user.id:
            raise HTTPException(status_code=400, detail="邮箱已被使用")
        user.email = user_update.email
        # 只有当邮箱实际改变时才重置验证状态
        user.email_verified = False
    else:
        # 如果邮箱没有改变，保持原有的验证状态
        user.email_verified = current_email_verified

    # 更新密码
    if user_update.password is not None:
        user.password = get_password_hash(user_update.password)

    # 更新头像
    if user_update.avatar is not None:
        user.avatar = user_update.avatar

    # 提交更改
    db.commit()
    db.refresh(user)

    return user

@router.put("/me/avatar", response_model=UserResponse)
async def update_user_avatar(
    avatar_data: dict,
    current_user: User = Depends(get_current_active_user),
    db: Session = Depends(get_db)
):
    """更新用户头像"""
    # 获取当前用户
    user = db.query(User).filter(User.id == current_user.id).first()
    if not user:
        raise HTTPException(status_code=404, detail="用户不存在")

    # 更新头像
    if "avatar" in avatar_data and avatar_data["avatar"] is not None:
        # 直接保存新的头像URL
        user.avatar = avatar_data["avatar"]
        db.commit()
        db.refresh(user)
        return user
    else:
        raise HTTPException(status_code=400, detail="未提供有效的头像数据")

@router.delete("/me", status_code=status.HTTP_204_NO_CONTENT)
async def delete_user_me(
    current_user: User = Depends(get_current_active_user),
    db: Session = Depends(get_db)
):
    """删除当前登录用户的账号"""
    # 获取当前用户
    user = db.query(User).filter(User.id == current_user.id).first()
    if not user:
        raise HTTPException(status_code=404, detail="用户不存在")

    # 删除用户
    db.delete(user)
    db.commit()

    return {"status": "success", "message": "用户已删除"}
