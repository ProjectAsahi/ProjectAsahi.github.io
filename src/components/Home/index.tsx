import React from "react";
import { RouteComponentProps } from "@reach/router";
import styles from './index.module.css';
import avatar from '../../assets/avatar.png';

export const Home = (props: RouteComponentProps) => {
    return <div className={styles.home_container}>
        <div className={styles.home_card}>
            <span style={{ fontSize: '2em' }}>
                “
            </span>
            <span>
                我叫朝陽，高垣朝陽
                <br />
                是男孩子！
            </span>
        </div>
        <div className={styles.avatar_container}>
            <img className={styles.avatar_img} src={avatar} alt="avatar" />
        </div>
    </div>;
}