<script setup>
import {ref, onMounted, computed } from 'vue';

const {offerJob, address} = defineProps({
  offerJob: {
    type: Object
  },
  address: {
    type: String
  }
});

onMounted(() => {
    formatSalary(offerJob.salary)
    console.log('address', address)
})

const salary = computed(() => formatSalary(offerJob?.salary));
const formatSalary = (input) => {
    if(!input) return '';
    const regex = /\d+\.\d+/g;
    return input.replace(regex, m => String(Math.floor(parseFloat(m))));
}   

const isTruncated = ref(true)
function untruncate(){
    isTruncated.value = !isTruncated.value
}

</script>

<template>
    <article class="offer-card" role="article">
        <div class="text-center"><b>{{ offerJob.title }}</b> - {{ offerJob.contractType }}</div> 
        <div>{{ offerJob.companyName }}</div> 
        <div>{{ address }}</div>
        <div>{{ offerJob.workingHours }} </div>
        <div>{{ salary }}</div>
        <div>{{ offerJob.experience }}</div>
        <div>{{ offerJob.sourceUrl }}</div>
        <div v-if="isTruncated" class="d-inline">
            {{offerJob.description.substring(0, 60) + '...'}}
            <button @click="untruncate()" v-if="isTruncated === true" class="btn btn-outline-primary btn-sm p-0 m-1">
                more
            </button>
        </div> 
        <div v-else>
            {{offerJob.description}}
            <button @click="untruncate()" class="btn btn-outline-primary btn-sm p-0 m-1">
                less
            </button>
        </div> 
    </article>

</template>

<style scoped>
.inline{
    display:flex;
}
.offer-card {
    word-wrap: break-word;       /* Ancien standard */
    overflow-wrap: break-word;   /* Standard moderne */
    white-space: normal;  
    background: white;
    padding: 5px 5px;
    border: 1px solid #cfe9f5;
    border-radius: 10px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.05);       
    margin-top: 1rem;
}
    
</style>

