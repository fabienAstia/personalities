<script setup>
import arrowCircle from '@/assets/pictos/arrowCircle.svg';
import home_background from '@/assets/images/home_img.png';
import { onMounted, onUnmounted} from 'vue'
import { useI18n } from 'vue-i18n';

const {t} = useI18n();

onMounted(() => {
    document.body.style.backgroundImage = `url(${home_background})`;
    document.body.style.backgroundPosition = 'center';
    document.body.style.backgroundSize = 'cover'
    document.body.style.backgroundRepeat = 'no-repeat';
})
onUnmounted(() =>{
    document.body.removeAttribute('style');
})

</script>

<template>
    <div class="home-centered container">
        <div class=" g-3 p-3 text-wrapper fs-6 fs-sm-4">
            <h1 class="text-center fs-2 fs-sm-0" :aria-label="t('home.title')">
                «{{t('home.title')}}»
            </h1>
            <p class="my-3 pt-2 text-center" :aria-label="t('home.paragraph1')">
                {{t('home.paragraph1')}}
            </p>
            <p class="my-3 pb-2 text-center" :aria-label="t('home.paragraph2')">
                {{t('home.paragraph2')}}
            </p>

            <div class=" d-flex justify-content-center">
                <router-link 
                    to="/answers" 
                    class="btn btn-success">
                        <span class="d-flex gap-2 fs-5">
                            {{t('home.take_the_test')}}
                            <img :src="arrowCircle">
                        </span>
                </router-link>
            </div>

        </div>
    </div>
</template>

<style scoped> 

.home-centered{
    flex: 1;
    max-width: 980px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    margin: auto;
}
.text-wrapper {
  backdrop-filter: blur(10px);
  background-color: rgba(0, 0, 0, 0.5); /* noir transparent */
  color: white;
  padding: 2rem;
  border-radius: 1rem;
}



</style>

