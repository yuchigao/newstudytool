<script setup lang="ts">
import { computed } from 'vue'
import { cn } from '@/lib/utils'

const props = withDefaults(
  defineProps<{
    class?: string
  }>(),
  {
    class: ''
  }
)

const cardClasses = computed(() => {
  return cn(
    'rounded-lg border bg-card text-card-foreground shadow-sm',
    props.class
  )
})
</script>

<template>
  <div :class="cardClasses">
    <slot />
  </div>
</template>
