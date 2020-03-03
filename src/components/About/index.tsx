import React from "react";
import { RouteComponentProps } from "@reach/router";
import styles from './index.module.css';
import { projectData } from "../../data/projectData";

export const About = (props: RouteComponentProps) => {
    return <div className={styles.about_container}>
        <table className={styles.about_info}>
            <tbody>
                {projectData.staff.map((it, index) => <tr key={index}>
                    <td>{it.title}</td>
                    <td style={{ color: it.color }}>
                        {it.link && <a href={it.link} target="_blank" rel="noopener noreferrer">
                            {it.name}
                        </a>}
                        {!it.link && it.name}
                    </td>
                </tr>)}
            </tbody>
        </table>
    </div>;
}