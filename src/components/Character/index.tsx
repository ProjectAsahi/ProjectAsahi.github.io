import React, { useState } from "react";
import styles from './index.module.css';
import gammingImage from './assets/gamming.webp';
import avatar3DImage from './assets/avatar_3d.webp';
import swimming from './assets/swimming.webp';
import live from './assets/live.webp';
import avatar from '../../assets/avatar.webp';


import gammingImagePng from './assets/gamming.png';
import avatar3DImagePng from './assets/avatar_3d.png';
import swimmingPng from './assets/swimming.png';
import livePng from './assets/live.png';
import avatarPng from '../../assets/avatar.png';


import { asahiData } from "../../data/asahiData";

const images = [
    {
        name: '人设图',
        img: avatar,
        imgPng: avatarPng,
    },
    {
        name: '3D模型',
        img: avatar3DImage,
        imgPng: avatar3DImagePng,
    },
    {
        name: '游戏中',
        img: gammingImage,
        imgPng: gammingImagePng,
    },
    {
        name: '泳装',
        img: swimming,
        imgPng: swimmingPng,
    },
    {
        name: '咖啡厅Live',
        img: live,
        imgPng: livePng,
    }
]

export const Character = () => {
    const [currentImg, setCurrentImg] = useState(images[2]);

    return <div className={styles.character_container}>
        <div className={styles.character_desc_container}>
            <span className={styles.avatar_name}>
                高垣朝陽
            </span>
            <br />
            <table className={styles.avatar_info}>
                <tbody>
                    {asahiData.basic.map((it, index) => <tr key={index}>
                        <td>{it.title}</td>
                        <td>{it.value}</td>
                    </tr>)}
                </tbody>
            </table>
            <br />
            <span>
                {asahiData.summary}
            </span>
        </div>
        <div className={styles.avatar_container}>
            <picture className={styles.avatar_img} >
                <source srcSet={currentImg.img} type="image/webp" />
                <img src={currentImg.imgPng} alt="avatar" />
            </picture>
            <div className={styles.avatar_img_section}>
                {images.map((it, index) => <div key={index} onClick={() => setCurrentImg(it)}>
                    {it.name}
                </div>)}
            </div>
        </div>
    </div>;
}