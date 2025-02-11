<template>

    <div class="container mx-auto">
        <h1 class="text-center my-5 font-bold text-3xl">Создание дивана</h1>

        <form @submit.prevent="createSofa">

            <v-text-field v-model="sofaForm.title" label="Название дивана"></v-text-field>
            <v-text-field v-model="sofaForm.price" label="Цена дивана"></v-text-field>
            <v-text-field v-model="sofaForm.material" label="Материал"></v-text-field>
            <div class="flex items-center gap-x-5">
                <v-select v-model="sofaForm.color" class="mb-0" label="Выберите цвет дивана" item-title="name"
                    item-value="id" :items="colors"></v-select>
                <v-btn @click="showModal = true">+</v-btn>
            </div>
            <v-btn type="submit">Создать</v-btn>
        </form>

    </div>


    <v-dialog max-width="500" v-model="showModal">
        <div class="bg-white !p-5">
            <form @submit.prevent="createColor">
                <v-text-field v-model="modalForm.name" label="Название цвета"></v-text-field>
                <label class="flex items-center gap-x-3 mb-5">
                    <span>Выберите цвет</span>
                    <input v-model="modalForm.hexColor" type="color">
                    <span>{{ modalForm.hexColor }}</span>
                </label>
                <v-btn type="submit" block>Сохранить</v-btn>
            </form>
        </div>
    </v-dialog>

</template>

<script setup>

const showModal = ref(false)

const modalForm = reactive({
    name: '',
    hexColor: ''
})

const sofaForm = reactive({
    title: '',
    price: '',
    material: '',
    color: null
})

const { data: colors, refresh } = await useFetch('/api/colors')
async function createColor() {
    const resp = await $fetch('/api/colors', {
        method: 'POST',
        body: modalForm
    })

    await refresh()

    showModal.value = false
}


async function createSofa() {
    const resp = await $fetch('/api/sofas', {
        method: 'POST',
        body: sofaForm
    })
}
</script>