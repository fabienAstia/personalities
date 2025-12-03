<script setup>
import {ref, onMounted, defineExpose} from 'vue'
import { Modal } from 'bootstrap'

let myModal = null
const alertTxt = ref({})

onMounted(()=>{
   myModal = new Modal('#modal')
})

function openModal(){
    myModal.show();
}
function closeModal(){
    myModal.close();
}

defineExpose({
    openModal, closeModal, alertTxt
})
</script>

<template>
    <!-- Modal -->
    <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalLabel"><span class="square">⚠️</span><b> Alert</b></h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="alert">
                {{ alertTxt }}
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
        </div>
    </div>
    </div>
</template>

<style scoped>
    #modal{
        z-index: 1350;
    }
    .alert{
        color: #e66a6a;
        font-weight: 700;
        font-size: larger;
        text-align: center;
        padding: 0;
        margin: 0;
    }
    #modalLabel{
        display: flex;
        align-items: center;
    }
    .square{
        width: 2rem;
        height: 2rem;
    }
</style>
