<template>

    <div>
        <ul v-if="data" class="flex flex-col gap-y-3">
            <li v-for="item in data.recipes" :key="item.id">{{ item.name }}</li>
        </ul>
    </div>

</template>

<script setup>

const { data, status, error, refresh, clear } = await useFetch('https://dummyjson.com/recipes')

</script>