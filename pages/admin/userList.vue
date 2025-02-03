<template>
    <h2>Список пользователей</h2>

    <ul>
        <li v-for="user in data" :key="user.id">
            {{ user.id }} || {{ user.fio }} || {{ user.email }}
        </li>
    </ul>
</template>

<script setup>

const { data } = await useFetch('/api/users')

</script>