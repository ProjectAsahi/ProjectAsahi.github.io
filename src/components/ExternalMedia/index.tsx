import React from "react";
import './index.css';
import { SocialMedias } from "../../config/SocialMedias";

interface IProps {
    colored: boolean,
    orientation: "verticel" | "horizontal"
}

export const ExternalMedia = (props: IProps) => {
    return <div className={`${props.orientation === "horizontal" ? "" : "verticel-media-logo-container"}`}>
        {SocialMedias.map((it, index) => <a key={index} href={it.link} target="_blank" rel="noopener noreferrer">
            <img src={props.colored ? it.logo.colored : it.logo.normal} alt={it.name} className="external-media-logo" />
        </a>)}
    </div>;
}