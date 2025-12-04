<script setup>
import { useI18n } from 'vue-i18n';
import { RouterLink } from 'vue-router';
import { useRouter } from 'vue-router';
import { sharedState} from '@/composables/useState'
import { formatAlert } from '@/composables/useMessageFormatter';
import { globalModal } from '@/composables/useGlobalModal';
import {watch, useTemplateRef } from 'vue';
import { sharedAlert, setShareAlert } from '@/composables/useState';
import clipBoard from '@/assets/pictos/clipBoard.svg';
import filePerson from '@/assets/pictos/filePerson.svg';
import personAdd from '@/assets/pictos/personAdd.svg';
import personCheck from '@/assets/pictos/personCheck.svg';
import personGear from '@/assets/pictos/personGear.svg';
import identify_yourself from '@/assets/pictos/identify_yourself.svg';
import logo from '@/assets/images/autres-images/logo.png';
import frFlag from '@/assets/images/frFlag.svg.png';
import ukFlag from '@/assets/images/ukFlag.svg';
import poFlag from '@/assets/images/Flag_of_Portugal.svg.png';

const { t, locale } = useI18n();
const route = useRouter();

const changeLanguage = (lang) => {
  locale.value = lang;
};

const clearLocalStorage = () => {
  localStorage.clear();
  sharedState.value = '';
  route.push("/")
}

watch(()=> sharedAlert.value, (newVal, oldVal) => {
    if(newVal === t('guard.no_token') || newVal === t('guard.expired_token')){
        console.log('formatAlert(newVal).message =', formatAlert(newVal).message  )
        globalModal.value.openModal()
        globalModal.value.alertTxt = formatAlert(newVal).message   
        setShareAlert("") 
    }
})
</script>

<template>
     <nav id="navbar" class="navbar nav navbar-expand-sm" >
      <div class="container-fluid">
        <router-link to="/" class="navbar-brand p-0" :aria-label="t('accessibility_header.home')">
          <img id="logo" :src="logo" alt="logo" class="header">
        </router-link>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
  
        <div class="collapse navbar-collapse  fs-md-6 fs-lg-5 " id="navbarNavDropdown">
          <ul class="navbar-nav me-auto gap-1">
            <li class="nav-item hover">
              <router-link to="/personalities" class="nav-link d-flex gap-1 justify-content-start fw-bold" :aria-label="$t('accessibility_header.personalities')">
                <img :src="filePerson" width="20px">
                {{t('header.personalities')}}
              </router-link>
            </li>
            <li class="nav-item hover">
              <router-link 
                to="/answers" 
                class=" nav-link d-flex gap-1 justify-content-start fw-bold" 
                :aria-label="$t('accessibility_header.test')">
                  <img :src="clipBoard" width="20px">
                  {{t('header.test')}}
              </router-link>
            </li>
          </ul>
        
          

          <ul class="navbar-nav ms-auto">

            <li v-if="sharedState !=='logged'" class="nav-item dropdown d-flex">
              <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <li class="nav-item hover">
                  <span class="nav-link d-flex gap-1 justify-content-start fw-bold" :aria-label="$t('accessibility_header.account')">
                    <img :src="identify_yourself" width="20px">
                    {{t('header.account')}}
                  </span>
                </li>
              </a>
              
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-start" style="width: 20px;">
                <li class="nav-item hover">
                  <router-link to="/register" class="nav-link d-flex gap-1 justify-content-start fw-bold" :aria-label="$t('accessibility_header.registration')">
                    <img :src="personAdd" width="20px">
                    {{t('header.registration')}}
                  </router-link>
                </li>
                <li class="nav-item hover">
                  <RouterLink to="/authenticate" class="nav-link d-flex gap-1 justify-content-start fw-bold" :aria-label="$t('accessibility_header.authentication')">
                    <img :src="personGear" width="20px">
                    {{t('header.authentication')}}
                  </RouterLink>
                </li>
              </ul>
            </li>

            <li v-if="sharedState ==='logged'" class="nav-item dropdown d-flex">
              <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <li class="nav-item hover">
                  <span class="nav-link d-flex gap-1 justify-content-start fw-bold" :aria-label="t('accessibility_header.welcome')">
                    <img :src="personCheck" width="20px">{{t('header.welcome')}} 
                  </span>
                </li>
              </a>
              
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-start" style="width: 20px;">
                <li class="hover nav-item fw-bold gap-1" :aria-label="t('accessibility_header.logout')">
                  <a @click="clearLocalStorage()" class="nav-link">{{t('header.logout')}}</a>
                </li>
              </ul>
            </li>
           
            <li class="nav-item dropdown d-flex">
              <a class="nav-link dropdown-toggle d-flex align-items-center gap-2" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" :aria-label="$t('accessibility_header.languages')">
                <img v-if="locale === 'fr'" :src="frFlag" width="35px" class="flag" :alt="t('accessibility_header.french')"> 
                <img v-if="locale === 'en'" :src="ukFlag" width="35px" class="flag" :alt="t('accessibility_header.english')">
                <img v-if="locale === 'pt'" :src="poFlag" width="35px" class="flag" :alt="t('accessibility_header.portuguese')">
              </a>
          
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-start" style="width: 20px;">
                <li>
                  <a class="dropdown-item d-flex align-items-center gap-2" href="#" @click="changeLanguage('fr')">
                    <img :src="frFlag" width="20px" :alt="t('accessibility_header.french')" class="flag"> FR 
                  </a>
                </li>
                <li>
                  <a class="dropdown-item d-flex align-items-center gap-2" href="#" @click="changeLanguage('en')">
                    <img :src="ukFlag" width="20px" :alt="$t('accessibility_header.english')" class="flag"> EN 
                  </a>
                </li>
                <li>
                  <a class="dropdown-item d-flex align-items-center gap-2" href="#" @click="changeLanguage('pt')">
                    <img :src="poFlag" width="20px" :alt="t('accessibility_header.portuguese')" class="flag"> PT 
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
</template>
  
  <style scoped>
  .header {
    height: 60px;
  }
  #logo {
    max-width: 100%;
    max-height: 100%;
  }
  .flag{
    border: 1px solid grey;
  }
  #navbar {
  position: sticky;
  top: 0;
  z-index: 1250; 
  background-color: #addee4;
  }
  .dropdown-menu {
    z-index: 1070; 
    background-color: #addee4; 
  }
  .hover :hover{
    background-color: #0077b6;
    color: white;
    cursor: pointer;
  }
 
  </style> 