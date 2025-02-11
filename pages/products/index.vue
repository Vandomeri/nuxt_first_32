<template>


    <div class="flex gap-x-10">

        <div class="w-1/3">

            <p class="my-3">По цене:</p>

            <v-range-slider v-model="range" :max="10" :min="-10" :step="1" class="align-center" hide-details>
                <template v-slot:prepend>
                    <v-text-field v-model="range[0]" density="compact" style="width: 70px" type="number"
                        variant="outlined" hide-details single-line></v-text-field>
                </template>
                <template v-slot:append>
                    <v-text-field v-model="range[1]" density="compact" style="width: 70px" type="number"
                        variant="outlined" hide-details single-line></v-text-field>
                </template>
            </v-range-slider>


            <hr class="my-5">


            <p>Фильтр по цвету:</p>
            <div class="flex flex-col gap-y-1 mt-3">
                <label class="flex items-center gap-x-2" v-for="color in colors" :key="color.id">
                    <input v-model="colorsFilter" type="checkbox" :value="color.id">
                    <span>{{ color.name }}</span>
                </label>
            </div>

            <v-btn @click="linkBuilder" class="mt-5" block>Применить сортировку</v-btn>




        </div>


        <div class="flex-1">
            <input type="search" v-model="searchQuery" @input="searchSofas">
            <div v-if="searchResults" class="mb-10">
                <ul>
                    <li v-for="item in searchResults">
                        {{ item.title }} ----- {{ item.price }}
                    </li>
                </ul>
            </div>
            <div>
                <ul v-if="data" class="grid grid-cols-3 justify-between  gap-5">
                    <li v-for="item in data" :key="item.id">
                        <div>{{ item.title }} - {{ item.price }}$</div>
                        <div class="flex items-center gap-x-3">
                            Цвет -
                            <div class="w-[20px] h-[20px] rounded-full"
                                :style="{ backgroundColor: item.sofas_colors.hex_color }">
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>


</template>

<script setup>

const baseLink = ref('http://localhost:3000/api/sofas')
const range = ref([1000, 10000])
const colorsFilter = ref([])


async function linkBuilder() {
    const url = new URL(baseLink.value)

    url.searchParams.append('min', range.value[0])
    url.searchParams.append('max', range.value[1])
    if (colorsFilter.value.length) {
        url.searchParams.append('colors', colorsFilter.value.join('-'))
    }

    const resp = await $fetch(url.toString())
    data.value = resp

}
const { data } = await useFetch(baseLink)


const { data: colors } = await useFetch('/api/colors')

const searchQuery = ref('')
const searchResults = ref([])


console.log(data)


async function searchSofas() {
    const resp = await $fetch('/api/sofas/search', {
        method: 'POST',
        body: {
            query: searchQuery.value
        }
    })
    searchResults.value = resp
}

</script>