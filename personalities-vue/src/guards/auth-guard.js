import { jwtDecode } from 'jwt-decode';
import i18n from '@/locales';
import { setShareAlert } from '@/composables/useState';

const t = i18n.global.t;

export function adminRole(to, from){
    const token = localStorage.getItem('jwt');
    if(!token){
        setShareAlert(t('guard.no_token'))
        return false;
    }
    try {
        const decodedToken = jwtDecode(token);
        if(decodedToken.role === 'ROLE_ADMIN'){
            setShareAlert("")
            return true;
        } else {
            return false;
        }
    } catch(error) {
        return '/';
    }
}

export function userRole(to, from){
    const token = localStorage.getItem('jwt');
    if(!token){
        setShareAlert(t('guard.no_token'))
        return false;
    }
    try {
        const decodedToken = jwtDecode(token);
        const current_time = Math.floor(Date.now() / 1000);
        if(current_time >= decodedToken.exp) {
            setShareAlert(t('guard.expired_token'))
            return false;
        }
        if(decodedToken.role === 'ROLE_USER' || decodedToken.role === 'ROLE_ADMIN'){
            return true;
        } 
        return false;
    } catch(error) {
        return '/';
    }
}

