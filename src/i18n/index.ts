import zhstrings from './zh.json';
import enstrings from './en.json';
import jastrings from './ja.json';

var languageMessages: any = {
    zh: flattenMessages(zhstrings),
    en: flattenMessages(enstrings),
    ja: flattenMessages(jastrings)
};

function getLocalMessage(language: string): any {
    var languageName = checkLanguageName(language);
    return languageMessages[languageName];
}

function flattenMessages(nestedMessages: any, prefix = "") {
    if (!nestedMessages) {
        return {};
    }
    return Object.keys(nestedMessages).reduce((messages, key) => {
        const value = nestedMessages[key];
        const prefixedKey = prefix ? `${prefix}.${key}` : key;

        if (typeof value === "string") {
            Object.assign(messages, { [prefixedKey]: value });
        } else {
            Object.assign(messages, flattenMessages(value, prefixedKey));
        }

        return messages;
    }, {});
}

function checkLanguageName(language: string): string {
    language = language.toLowerCase();
    const languages = getLanguages();
    if (languages.some((it) => it === language)) {
        return languages.filter((it) => it === language)[0];
    }
    language = language.split("-")[0];
    if (languages.some((it) => it === language)) {
        return languages.filter((it) => it === language)[0];
    }
    return "";
}

function getLanguages() {
    return ["zh", "en", "ja"];
}

export {
    getLocalMessage,
    getLanguages,
    checkLanguageName,
};
