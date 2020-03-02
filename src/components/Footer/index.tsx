import React from "react";
import styles from './index.module.css';
import { Copyright } from "../Copyright";

export const Footer = () => {
    return <div className={styles.footer_container}>
        <Copyright/>
    </div>;
}