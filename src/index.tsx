import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import * as serviceWorker from './serviceWorker';
import { IntlProvider } from 'react-intl'
import globalState from './config/globalState';
import { getLocalMessage, checkLanguageName } from "./i18n";

const Index = () => {
    const [language] = globalState.useGlobalState('language');

    return <IntlProvider locale={checkLanguageName(language)} messages={getLocalMessage(language)}>
        <App />
    </IntlProvider>;
}

ReactDOM.render(<Index />, document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
