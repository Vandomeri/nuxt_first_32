<template>

    <form @submit.prevent="registerUser" class="max-w-[500px] mx-auto my-20 flex flex-col gap-y-5">

        <input v-model="form.email" class="py-2 px-4 border-amber-600 border" type="email" placeholder="Введите email">
        <input v-model="form.fio" class="py-2 px-4 border-amber-600 border" type="text" placeholder="Введите ФИО">
        <input v-model="form.password" class="py-2 px-4 border-amber-600 border" type="password"
            placeholder="Введите пароль">
        <button class="py-2 px-4 bg-amber-600 text-white">Зарегестрироваться</button>

    </form>

</template>

<script setup>

const form = reactive({
    email: '',
    fio: '',
    password: ''
})

async function registerUser() {
    const { data } = await useFetch('/api/users', {
        method: 'post',
        body: {
            email: form.email,
            fio: form.fio,
            password: form.password
        }
    })
}

</script>