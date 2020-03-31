import { createGlobalState } from 'react-hooks-global-state';
import { checkLanguageName } from '../i18n';

const initialState = {
    language: checkLanguageName(navigator.language)
};
export default createGlobalState(initialState);