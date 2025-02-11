<template>
  <header class="flex gap-x-4">
    <NuxtLink to="/">Main</NuxtLink>
    <NuxtLink to="/register">Register</NuxtLink>
    <NuxtLink to="/admin/userList">Admin - Users</NuxtLink>
    <NuxtLink to="/admin/sofas/createSofa">Admin - Sofa Create</NuxtLink>
  </header>
  <div>
    <NuxtPage />
  </div>
</template>
