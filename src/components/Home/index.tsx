import React from "react";
import { RouteComponentProps } from "@reach/router";
import styles from './index.module.css';
import avatar from '../../assets/avatar.webp';
import avatarPng from '../../assets/avatar.png';
import { FormattedMessage } from "react-intl";

export const Home = (props: RouteComponentProps) => {
    return <div className={styles.home_container}>
        <div className={styles.home_card}>
            <span style={{ fontSize: '2em' }}>
                <FormattedMessage
                    id="language_reference_start"
                />
            </span>
            <span style={{whiteSpace: 'pre-line'}}>
                <FormattedMessage
                    id="asahi.intro"
                />
            </span>
        </div>
        <div className={styles.avatar_container}>
            <picture className={styles.avatar_img} >
                <source srcSet={avatar} type="image/webp" />
                <img src={avatarPng} alt="avatar" />
            </picture>
        </div>
    </div>;
}