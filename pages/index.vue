<template>
    <div>
        <button @click="counter--">-</button>
        <span>{{ counter }}</span>
        <button @click="counter++">+</button>
    </div>
</template>

<script setup>

const counter = ref(0)

</script>

<style scoped></style>