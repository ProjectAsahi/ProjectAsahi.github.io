import React from "react";
import { RouteComponentProps } from "@reach/router";
import { Footer } from "../Footer";
import styles from './index.module.css';

export const Home = (props: RouteComponentProps) => {
    return <div className={styles.home_container}>
        <div>

        </div>
      <Footer />
    </div>;
}