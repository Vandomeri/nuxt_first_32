<template>
    <h2>Список пользователей</h2>
    <v-text-field v-model="search" label="Поиск..."></v-text-field>
    <v-data-table v-model:sort-by="sortBy" :search="search" :headers="headers" :items="users">

        <template v-slot:item.id="{ value }">
            <div class="w-[30px] h-[30px] grid place-items-center rounded-full p-2 border border-red-500">
                {{ value }}
            </div>
        </template>


        <template v-slot:item.actions="{ item }">
            <div class="flex gap-x-2">
                <button @click="editUser(item)">Edit</button>
                <button @click="deleteUser(item.id)">Delete</button>
            </div>
        </template>


    </v-data-table>


    <v-dialog max-width="500" v-model="showModal">
        <div class="bg-white !p-5">
            <form @submit.prevent="editFetch">
                <v-text-field v-model="modalForm.fio" label="ФИО"></v-text-field>
                <v-text-field v-model="modalForm.email" label="E-mail"></v-text-field>
                <v-text-field v-model="modalForm.password" label="Пароль"></v-text-field>
                <v-btn type="submit" block>Сохранить</v-btn>
            </form>
        </div>
    </v-dialog>
</template>

<script setup>



const showModal = ref(false)
const search = ref('')
const sortBy = ref([{ key: 'id', order: 'desc' }],)
const headers = ref([
    { title: 'ID', key: 'id', sortable: true },
    { title: 'ФИО', key: 'fio', sortable: true },
    { title: 'E-mail', key: 'email' },
    { title: 'Пароль', key: 'password' },
    { title: 'Действия', key: 'actions' }
])

const modalForm = reactive({
    id: null,
    fio: '',
    email: '',
    password: ''
})

const { data: users, refresh } = await useFetch('/api/users')


async function deleteUser(id) {
    const { data: deletedUser } = await useFetch('/api/users', {
        method: 'delete',
        body: {
            userId: id
        }
    })

    const index = users.value.findIndex((el) => el.id == deletedUser.value.id)

    if (index !== -1) {
        users.value.splice(index, 1)
    }

}

async function editUser(item) {
    modalForm.id = item.id
    modalForm.email = item.email
    modalForm.fio = item.fio
    modalForm.password = item.password

    showModal.value = true
}

async function editFetch() {
    const { data: editedUser } = await useFetch('/api/users', {
        method: 'put',
        body: modalForm
    })

    await refresh()

    showModal.value = false
}


</script>