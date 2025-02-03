export default defineEventHandler(async (event) => {

    const body = await readBody(event)

    return {
        message: `Вы успешно заказали услугу: "${body.service}"`
    }

})