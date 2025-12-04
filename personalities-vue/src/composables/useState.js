import {ref} from 'vue';
import { jwtDecode } from 'jwt-decode';

export const sharedState = ref('');
export const sharedAlert = ref('');

export function useSharedState(){
    const token = localStorage.getItem('jwt');
    if(!token) {
        sharedState.value = 'guest';
        return sharedState;
    } else {
        const decodedToken = jwtDecode(token);
        const currentTime = new Date().getTime() / 1000;
        if(decodedToken.role === 'ROLE_USER' && currentTime < decodedToken.exp 
            || decodedToken.role === 'ROLE_ADMIN' && currentTime < decodedToken.exp) {
            sharedState.value = 'logged'
        } else {
            sharedState.value = 'guest'
        }
    }
    return sharedState;
}
export function setShareState(state){
    sharedState.value = state;
}

export function setShareAlert(alert){
    sharedAlert.value = alert;
}

