PGDMP  +    -                }            KorsonStudySystem #   16.8 (Ubuntu 16.8-0ubuntu0.24.04.1) #   16.8 (Ubuntu 16.8-0ubuntu0.24.04.1) /    z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            {           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            |           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            }           1262    27182    KorsonStudySystem    DATABASE        CREATE DATABASE "KorsonStudySystem" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
 #   DROP DATABASE "KorsonStudySystem";
                dbuser    false            �            1259    27263    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            ~           0    0    TABLE alembic_version    ACL     5   GRANT ALL ON TABLE public.alembic_version TO dbuser;
          public          postgres    false    223            �            1259    27202    common_users    TABLE     U  CREATE TABLE public.common_users (
    id integer NOT NULL,
    username character varying,
    email character varying,
    password character varying,
    is_active boolean,
    is_superuser boolean,
    created_at timestamp without time zone DEFAULT now(),
    email_verified boolean NOT NULL,
    verification_token character varying
);
     DROP TABLE public.common_users;
       public         heap    dbuser    false            �            1259    27201    common_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.common_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.common_users_id_seq;
       public          dbuser    false    216                       0    0    common_users_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.common_users_id_seq OWNED BY public.common_users.id;
          public          dbuser    false    215            �            1259    27248    study_achievements    TABLE     �   CREATE TABLE public.study_achievements (
    id integer NOT NULL,
    user_id integer,
    type character varying,
    level integer,
    unlocked_at timestamp without time zone DEFAULT now()
);
 &   DROP TABLE public.study_achievements;
       public         heap    dbuser    false            �            1259    27247    study_achievements_id_seq    SEQUENCE     �   CREATE SEQUENCE public.study_achievements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.study_achievements_id_seq;
       public          dbuser    false    222            �           0    0    study_achievements_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.study_achievements_id_seq OWNED BY public.study_achievements.id;
          public          dbuser    false    221            �            1259    27231    study_plans    TABLE     *  CREATE TABLE public.study_plans (
    id integer NOT NULL,
    user_id integer,
    text character varying,
    completed boolean,
    started boolean,
    created_at timestamp without time zone DEFAULT now(),
    start_time timestamp without time zone,
    end_time timestamp without time zone
);
    DROP TABLE public.study_plans;
       public         heap    dbuser    false            �            1259    27230    study_plans_id_seq    SEQUENCE     �   CREATE SEQUENCE public.study_plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.study_plans_id_seq;
       public          dbuser    false    220            �           0    0    study_plans_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.study_plans_id_seq OWNED BY public.study_plans.id;
          public          dbuser    false    219            �            1259    27215    study_tasks    TABLE     �   CREATE TABLE public.study_tasks (
    id integer NOT NULL,
    name character varying,
    duration integer,
    start timestamp without time zone,
    "end" timestamp without time zone,
    completed boolean,
    user_id integer
);
    DROP TABLE public.study_tasks;
       public         heap    dbuser    false            �            1259    27214    study_tasks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.study_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.study_tasks_id_seq;
       public          dbuser    false    218            �           0    0    study_tasks_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.study_tasks_id_seq OWNED BY public.study_tasks.id;
          public          dbuser    false    217            �           2604    27205    common_users id    DEFAULT     r   ALTER TABLE ONLY public.common_users ALTER COLUMN id SET DEFAULT nextval('public.common_users_id_seq'::regclass);
 >   ALTER TABLE public.common_users ALTER COLUMN id DROP DEFAULT;
       public          dbuser    false    215    216    216            �           2604    27251    study_achievements id    DEFAULT     ~   ALTER TABLE ONLY public.study_achievements ALTER COLUMN id SET DEFAULT nextval('public.study_achievements_id_seq'::regclass);
 D   ALTER TABLE public.study_achievements ALTER COLUMN id DROP DEFAULT;
       public          dbuser    false    222    221    222            �           2604    27234    study_plans id    DEFAULT     p   ALTER TABLE ONLY public.study_plans ALTER COLUMN id SET DEFAULT nextval('public.study_plans_id_seq'::regclass);
 =   ALTER TABLE public.study_plans ALTER COLUMN id DROP DEFAULT;
       public          dbuser    false    219    220    220            �           2604    27218    study_tasks id    DEFAULT     p   ALTER TABLE ONLY public.study_tasks ALTER COLUMN id SET DEFAULT nextval('public.study_tasks_id_seq'::regclass);
 =   ALTER TABLE public.study_tasks ALTER COLUMN id DROP DEFAULT;
       public          dbuser    false    218    217    218            w          0    27263    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    223   56       p          0    27202    common_users 
   TABLE DATA           �   COPY public.common_users (id, username, email, password, is_active, is_superuser, created_at, email_verified, verification_token) FROM stdin;
    public          dbuser    false    216   ]6       v          0    27248    study_achievements 
   TABLE DATA           S   COPY public.study_achievements (id, user_id, type, level, unlocked_at) FROM stdin;
    public          dbuser    false    222   �9       t          0    27231    study_plans 
   TABLE DATA           n   COPY public.study_plans (id, user_id, text, completed, started, created_at, start_time, end_time) FROM stdin;
    public          dbuser    false    220   �:       r          0    27215    study_tasks 
   TABLE DATA           [   COPY public.study_tasks (id, name, duration, start, "end", completed, user_id) FROM stdin;
    public          dbuser    false    218   �<       �           0    0    common_users_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.common_users_id_seq', 15, true);
          public          dbuser    false    215            �           0    0    study_achievements_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.study_achievements_id_seq', 19, true);
          public          dbuser    false    221            �           0    0    study_plans_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.study_plans_id_seq', 25, true);
          public          dbuser    false    219            �           0    0    study_tasks_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.study_tasks_id_seq', 78, true);
          public          dbuser    false    217            �           2606    27267 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    223            �           2606    27210    common_users common_users_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.common_users
    ADD CONSTRAINT common_users_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.common_users DROP CONSTRAINT common_users_pkey;
       public            dbuser    false    216            �           2606    27256 *   study_achievements study_achievements_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.study_achievements
    ADD CONSTRAINT study_achievements_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.study_achievements DROP CONSTRAINT study_achievements_pkey;
       public            dbuser    false    222            �           2606    27239    study_plans study_plans_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.study_plans
    ADD CONSTRAINT study_plans_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.study_plans DROP CONSTRAINT study_plans_pkey;
       public            dbuser    false    220            �           2606    27222    study_tasks study_tasks_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.study_tasks
    ADD CONSTRAINT study_tasks_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.study_tasks DROP CONSTRAINT study_tasks_pkey;
       public            dbuser    false    218            �           1259    27212    ix_common_users_email    INDEX     V   CREATE UNIQUE INDEX ix_common_users_email ON public.common_users USING btree (email);
 )   DROP INDEX public.ix_common_users_email;
       public            dbuser    false    216            �           1259    27213    ix_common_users_id    INDEX     I   CREATE INDEX ix_common_users_id ON public.common_users USING btree (id);
 &   DROP INDEX public.ix_common_users_id;
       public            dbuser    false    216            �           1259    27211    ix_common_users_username    INDEX     \   CREATE UNIQUE INDEX ix_common_users_username ON public.common_users USING btree (username);
 ,   DROP INDEX public.ix_common_users_username;
       public            dbuser    false    216            �           1259    27262    ix_study_achievements_id    INDEX     U   CREATE INDEX ix_study_achievements_id ON public.study_achievements USING btree (id);
 ,   DROP INDEX public.ix_study_achievements_id;
       public            dbuser    false    222            �           1259    27245    ix_study_plans_id    INDEX     G   CREATE INDEX ix_study_plans_id ON public.study_plans USING btree (id);
 %   DROP INDEX public.ix_study_plans_id;
       public            dbuser    false    220            �           1259    27246    ix_study_plans_text    INDEX     K   CREATE INDEX ix_study_plans_text ON public.study_plans USING btree (text);
 '   DROP INDEX public.ix_study_plans_text;
       public            dbuser    false    220            �           1259    27228    ix_study_tasks_id    INDEX     G   CREATE INDEX ix_study_tasks_id ON public.study_tasks USING btree (id);
 %   DROP INDEX public.ix_study_tasks_id;
       public            dbuser    false    218            �           1259    27229    ix_study_tasks_name    INDEX     K   CREATE INDEX ix_study_tasks_name ON public.study_tasks USING btree (name);
 '   DROP INDEX public.ix_study_tasks_name;
       public            dbuser    false    218            �           2606    27257 2   study_achievements study_achievements_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_achievements
    ADD CONSTRAINT study_achievements_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.common_users(id);
 \   ALTER TABLE ONLY public.study_achievements DROP CONSTRAINT study_achievements_user_id_fkey;
       public          dbuser    false    3276    216    222            �           2606    27240 $   study_plans study_plans_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_plans
    ADD CONSTRAINT study_plans_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.common_users(id);
 N   ALTER TABLE ONLY public.study_plans DROP CONSTRAINT study_plans_user_id_fkey;
       public          dbuser    false    216    3276    220            �           2606    27223 $   study_tasks study_tasks_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_tasks
    ADD CONSTRAINT study_tasks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.common_users(id);
 N   ALTER TABLE ONLY public.study_tasks DROP CONSTRAINT study_tasks_user_id_fkey;
       public          dbuser    false    216    218    3276            w      x�36�0L3�45\1z\\\ &�      p     x�m����6�k�SPL��%K�<��Nc��s�ҥ�J�#M�y��M��[ē3Yk�I��v����[��������3��Q!cH�`N�����,�1y6���vyJ\����"�^8q��=����ĵ	�E�2:��0��Z�  �*�ZAH�HS$T����}<	��p���	�n�$������AA��Ґ���lu6��mu{h�A#��vk��r:��w�����5�jDB�(��2\�%��������?��8q�4ܿ��{[�[���_s������3�FF6!�����}��#�&�f�p���Ǌ��F��ʐ��<F`sy߀Q����d�g��U�"Wz�Wu�QM�]ɪ8wg�h�
��s�fQM[Q�z�3��?`��	DR�~���3�����2)ȸH�2�o��I�����t�4�� n/����>9�z��q���{2���QR�&��2�K�R$�t}pC�n�M��F�rem�;��^hM��>[�"��YW��9�6�;UH�r���d(r� 0�/�3R.��i�,�K�$�`'	<��uQ���[�6��Qκ���)N�I\��H\ARSM�R*K�JS`��5�X�BUCn�$}�/.�a(Gg9`b{��X;���J��������Y��`��
��Q����* �o��\ᏥN�p%�E�3{�P6D�H�������9���\ɛ���
mۢ���l�n�d��#�~�0
��S$�)����z{�XW���O!���O�v*v���f]���Cдō����wV*�i�h�A�",?�6mw�ʓ����
p�Lx��}7��v>*�Nx��ɧc?J�'+�A'�j�O��u������l���Vv:��l��������/��}�      v     x�}��J1���)����5��"2�]��og�-�^av�5=I�#�׷�����<��_p�����<І�ڝ=�d������ɏ��:r�TVx6����o�Ü���rYy/�Cpq������� ��,�C��0� �{�Z�cf�^�庠m��[��p��=h����ծ��^�Å�׵z+��tsU@ڹ=��n�ؼ/�o8�ĝ`��գ �ƀ�T����m������ͷ ާ�k�z�U9	���o �z�D�{��i      t   �  x�u�MnAF�5��`��ʮCp��9A��kRV\�H���0Ɏ+�5��G]�W���n*T���ˏ���K7��!�T���9p��7h[�:z��"Ŋj�V��Gc�,i]�U����MURt4peG�X�����Ǜ��߾���q��BiC�	X%�����w�w_���}y��v�*2ߢ�h�.TG�*���ό��DW@s�s����^�V��>�\�̀�J��wmKv8���7�"u����Q���W�S��,�uin>�C&�9S�ˎ�0G�My��ڗ��x'3�K����d��͹�$ޓ���)�"�d�Fs�ׯ�lQX0�L� �?�>~���>�ij��\'S1�����6��'Xύ�N�45��r�+}���	�4Ż      r   �  x�m�M�T1��y��(IU*_������F�JE�¬���FP�Mw��+X����K�����?�޿>��X�'��qgmq�8?aɼ6aA�p����;V�ś�����o��߇O���yob�<]�� V=�W�o���*kGU*dY����˗F�ad���D�8�^��[ �O��L�s�(�,�͚�U"����æCC[	`[�OXn�)���������$����M\��ﭙo���Ïs�лpf|L��~s ��ǂA3rM��<l��	�,�&�:p}b�+K�U"���s�Uq�Z�⫫����c|֌�	�F�M&�jp�Lg��/�:uTȏ�K�f"���r��u���J�-�5�j�_8��^'+c����\_DT2n��G���!���c�q�VQ6*���Fv6�$�X;a��M3H�O�Ă�ϯ�><���?���v�+x�Ł�}����}���[T���㤗��OgFm.��}\S����o#�AI�>�	[�ĭ$H�Z����e0�$<LI3\m�wF�D�����Z��C7�n���\4�|[�@C�\���,�v!|��t��5�E(֪�I==��>+��\�'�P}R�����<�����h��4󁲬�ӹa�C�Ь� �ɫd�E)�L:���T�פ�ɸߓf�uH�����<7넭y�OIf8 j��`E.:�a-�f�Ώ�E�y�����y�;�������wO�e�F��I     