<template>

    Страница "Service"

    <input v-model="data" type="text" placeholder="Введите желаемую услугу">
    <button @click="sendData()">Отправить</button>
    <p v-if="response">{{ response.message }}</p>
</template>

<script setup>

const data = ref('')
const response = ref('')

async function sendData() {
    const { data: result } = await useFetch('/api/users', {
        method: 'post',
        body: {
            service: data.value
        }
    })
    response.value = result.value
}



</script>