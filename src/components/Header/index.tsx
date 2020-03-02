import React, { useState } from "react";
import menu from './assets/menu.svg';
import menu_white from './assets/menu_white.svg';
import './index.css';
import { routes } from "../../config/routes";
import { ExternalMedia } from "../ExternalMedia";
import { Link } from "@reach/router"
import logoAnimation from './assets/projectasahi_logo.json';
import { Lottie } from "@crello/react-lottie";

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
    return <div className="header-container">
        <div className="logo-container">
            {shouldLogoAnimationPlay &&
                <Lottie config={{ animationData: logoAnimation, loop: false }}></Lottie>}
        </div>
        <div className="menu-container">
            <div className="menu-content">
                {menus.map((it, index) => <Link key={index} to={it.path}>{it.display}</Link>)}
            </div>
            <div className="external-media-container">
                <ExternalMedia colored={true} orientation="verticel" />
            </div>
        </div>
        <div className="menu-button-container">
            <img src={menu} alt="menu button" onClick={() => setMenuPanelShown(true)} className="menu-button" />
            <div className={`menu-layout menu-background ${menuPanelShown ? "menu-background-show" : "menu-background-hide"}`} onClick={() => setMenuPanelShown(false)}></div>
            <div className={`${menuPanelShown ? "menu-show" : ""} menu-layout`} style={{ display: shouldMenuDisplay ? 'block' : 'none' }}>
                <img src={menu_white} alt="menu close button" onClick={() => setMenuPanelShown(false)} className="menu-button menu-close-button" />
                <div className="menu-content verticel-menu">
                    {menus.map((it, index) => <Link key={index} onClick={() => setMenuPanelShown(false)} to={it.path}>{it.display}</Link>)}
                    <div>
                        <ExternalMedia colored={false} orientation="horizontal" />
                    </div>
                </div>
            </div>
        </div>
    </div>;
}