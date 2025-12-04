<script setup>
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';
import { useRoute } from 'vue-router'
import { useTemplateRef } from 'vue';
import { useI18n } from 'vue-i18n';
import { globalModal } from './composables/useGlobalModal';
import {ref} from 'vue'

import Alert from '@/components/Alert.vue'

const {t} = useI18n();
const route = useRoute()

</script>

<template>
  <div class="fullScreen">
    <Header/> 
    <div class="general_container" :class="{
      no_layout: ['home', 'authenticate', 'register'].includes(route.name)
    }">
      <router-view /> 
    </div> 
    <Footer/>
  </div>
  <Alert ref="globalModal"/>
</template>

<style scoped>
.container-md {
  max-width: 576px !important;
}
.fullScreen{
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}
.general_container{
  margin: 2rem auto; 
  max-width: 95%;
  flex: 1;
} 
.no_layout{
  margin: 0;
  padding: 0;
  max-width: none;
  display: flex;
}
</style>
