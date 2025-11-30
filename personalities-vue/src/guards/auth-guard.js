import { jwtDecode } from 'jwt-decode';
import i18n from '@/locales';
import { formatAlert } from '@/composables/useMessageFormatter';

const t = i18n.global.t;

export function adminRole(to, from){
    const token = localStorage.getItem('jwt');
    if(!token){
        return '/';
    }
    try {
        const decodedToken = jwtDecode(token);
        if(decodedToken.role === 'ROLE_ADMIN'){
            return true;
        } else {
            return '/'
        }
    } catch(error) {
        return '/';
    }
}

export function userRole(to, from){
    let token = localStorage.getItem('jwt');
    if(!token){
        // alert(t('guard.no_token'))
        formatAlert(t('guard.no_token'))
        return '/';
    }
    try {
        const decodedToken = jwtDecode(token);
        const current_time = Math.floor(Date.now() / 1000);
        if(current_time >= decodedToken.exp) {
            alert(t('guard.expired_token'))
            return '/';
        }
        if(decodedToken.role === 'ROLE_USER' || decodedToken.role === 'ROLE_ADMIN'){
            return true;
        } 
        return '/';
    } catch(error) {
        return '/';
    }
}

