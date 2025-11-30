<script setup>
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
const idealistes = ['INFJ', 'INFP', 'ENFJ', 'ENFP']
const rationnels = ['INTJ', 'INTP', 'ENTJ', 'ENTP']
const gardiens = ['ISTJ', 'ISFJ', 'ESTJ', 'ESFJ']
const artisans = ['ISTP', 'ISFP', 'ESTP', 'ESFP']
const baseURL = import.meta.env.BASE_URL;
const router = useRouter();
const {t} = useI18n();

</script>

<template>
    <div class="container-fluid">
        <div class="row text-center mb-4">
            <div class="title mb-3"><b>{{t('personalities.idealists')}}</b></div>
            <div v-for="type in idealistes" class="col-12 col-sm-3 text-center mb-2">
                <router-link class="style" :to="`/personality/${type}`">
                    <h5>{{type}}</h5>
                    <img class="img-fluid" :src="`${baseURL}mbtiTypes/${type}.webp`" alt="">
                    <div><b>{{t(`personality.${type}`)}}</b></div>
                </router-link>
            </div>
        </div>

        <div class="row text-center mb-4">
            <div class="title mb-3"><b>{{$t('personalities.rationals')}}</b></div>
            <div v-for="type in rationnels" class="col-12 col-sm-3 text-center mb-2">
                <router-link class="style" :to="`/personality/${type}`">
                    <h5>{{type}}</h5>
                    <img class="img-fluid" :src="`${baseURL}mbtiTypes/${type}.webp`" alt="">
                    <div><b>{{t(`personality.${type}`)}}</b></div>
                </router-link>
            </div>
        </div>

        <div class="row text-center mb-4">
            <div class="title mb-3"><b>{{$t('personalities.guardians')}}</b></div>
            <div v-for="type in gardiens" class="col-12 col-sm-3 text-center mb-2">
                <router-link class="style" :to="`/personality/${type}`">
                    <h5>{{type}}</h5>
                    <img class="img-fluid" :src="`${baseURL}mbtiTypes/${type}.webp`" alt="">
                    <div><b>{{t(`personality.${type}`)}}</b></div>
                </router-link>
            </div>
        </div>

        <div class="row text-center mb-4">
            <div class="title mb-3"><b>{{$t('personalities.artisans')}}</b></div>
            <div v-for="type in artisans" class="col-12 col-sm-3 text-center mb-2">
                <router-link class="style" :to="`/personality/${type}`">
                    <h5>{{type}}</h5>
                    <img class="img-fluid" :src="`${baseURL}mbtiTypes/${type}.webp`" alt="">
                    <div><b>{{t(`personality.${type}`)}}</b></div>
                </router-link>
            </div>
        </div>

    </div>

</template>

<style scoped>
.img-fluid{
    width: 100%;
    min-width: 60px;
    max-width: 200px;
    object-fit: contain;
}
.title{
    font-size: x-large;
    color: #0077b6;
    text-shadow:
        0px 1px 0px #270446,
        0px 2px 0px #270446,
        0px 3px 0px #270446,

        0px 5px 5px #270446;
}
.style{
    cursor: pointer;
    text-decoration: none;
    color: #270446;
}
h5{
    font-weight: 700;
}

</style>