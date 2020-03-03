import React, { useState } from "react";
import styles from './index.module.css';
import gammingImage from './assets/gamming.png';
import avatar3DImage from './assets/avatar_3d.png';
import swimming from './assets/swimming.png';
import live from './assets/live.png';
import { asahiData } from "../../data/asahiData";
import avatar from '../../assets/avatar.png';

const images = [
    {
        name: '人设图',
        img: avatar
    },
    {
        name: '3D模型',
        img: avatar3DImage
    },
    {
        name: '游戏中',
        img: gammingImage
    },
    {
        name: '泳装',
        img: swimming
    },
    {
        name: '咖啡厅Live',
        img: live
    }
]

export const Character = () => {
    const [currentImg, setCurrentImg] = useState(images[2].img);

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
            <img className={styles.avatar_img} src={currentImg} alt="avatar" />
            <div className={styles.avatar_img_section}>
                {images.map((it, index) => <div key={index} onClick={() => setCurrentImg(it.img)}>
                    {it.name}
                </div>)}
            </div>
        </div>
    </div>;
}