import React, { useState } from "react";
import menu from './assets/menu.svg';
import menu_white from './assets/menu_white.svg';
import styles from './index.module.css';
import { routes } from "../../config/routes";
import { ExternalMedia } from "../ExternalMedia";
import { Link } from "@reach/router"
import logoAnimation from './assets/projectasahi_logo.json';
import { Lottie } from "@crello/react-lottie";
import globalState from "../../config/globalState";

export const Header = () => {
    const [menuPanelShown, setMenuPanelShown] = useState(false);
    const [shouldMenuDisplay, setShouldMenuDisplay] = useState(false);
    const [shouldLogoAnimationPlay, setShoulLogoAnimationPlay] = useState(false);
    const menus = routes.sort((n1, n2) => n1.order - n2.order);

    setTimeout(() => {
        setShoulLogoAnimationPlay(true);
    }, 3500);

    setTimeout(() => {
        setShouldMenuDisplay(true);
    }, 4000);
    const [language, setLanguage] = globalState.useGlobalState('language');
    return <div className={styles.header_container}>
        <div className={styles.logo_container}>
            {shouldLogoAnimationPlay &&
                <Lottie config={{ animationData: logoAnimation, loop: false }}></Lottie>}
        </div>
        <div className={styles.menu_container}>
            <div className={styles.menu_content}>
                {menus.map((it, index) => <Link key={index} to={it.path}>{it.display}</Link>)}
            </div>
            <div className={styles.external_media_container}>
                <select value={language} onChange={(e) => setLanguage(e.target.value)}>
                    <option value="zh">中文</option>
                    <option value="ja">日本語</option>
                    <option value="en">English</option>
                </select>
                <ExternalMedia colored={true} orientation="verticel" />
            </div>
        </div>
        <div className={styles.menu_button_container}>
            <img src={menu} alt="menu button" onClick={() => setMenuPanelShown(true)} className={styles.menu_button} />
            <div className={`${styles.menu_layout} ${styles.menu_background} ${menuPanelShown ? styles.menu_background_show : styles.menu_background_hide}`} onClick={() => setMenuPanelShown(false)}></div>
            <div className={`${menuPanelShown ? styles.menu_show : ""} ${styles.menu_layout}`} style={{ display: shouldMenuDisplay ? 'block' : 'none' }}>
                <img src={menu_white} alt="menu close button" onClick={() => setMenuPanelShown(false)} className={`${styles.menu_button} ${styles.menu_close_button}`} />
                <div className={`${styles.menu_content} ${styles.verticel_menu}`}>
                    {menus.map((it, index) => <Link key={index} onClick={() => setMenuPanelShown(false)} to={it.path}>{it.display}</Link>)}
                    <select value={language} onChange={(e) => setLanguage(e.target.value)}>
                        <option value="zh">中文</option>
                        <option value="ja">日本語</option>
                        <option value="en">English</option>
                    </select>
                    <div>
                        <ExternalMedia colored={false} orientation="horizontal" />
                    </div>
                </div>
            </div>
        </div>
    </div>;
}