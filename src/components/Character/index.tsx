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
import { FormattedMessage } from "react-intl";

const images = [
    {
        name: 'character_design',
        img: avatar,
        imgPng: avatarPng,
    },
    {
        name: '3d_model',
        img: avatar3DImage,
        imgPng: avatar3DImagePng,
    },
    {
        name: 'asahi.data.gamming',
        img: gammingImage,
        imgPng: gammingImagePng,
    },
    {
        name: 'swimsuit',
        img: swimming,
        imgPng: swimmingPng,
    },
    {
        name: 'asahi.data.living',
        img: live,
        imgPng: livePng,
    }
]

export const Character = () => {
    const [currentImg, setCurrentImg] = useState(images[2]);
    return <div className={styles.character_container}>
        <div className={styles.character_desc_container}>
            <span className={styles.avatar_name}>
                <FormattedMessage
                    id={asahiData.name}
                    defaultMessage={asahiData.name}
                />
            </span>
            <br />
            <table className={styles.avatar_info}>
                <tbody>
                    {asahiData.basic.map((it, index) => <tr key={index}>
                        <td>
                            <FormattedMessage
                                id={it.title}
                                defaultMessage={it.title}
                            />
                        </td>
                        <td>
                            <FormattedMessage
                                id={it.value}
                                defaultMessage={it.value}
                            />
                        </td>
                    </tr>)}
                </tbody>
            </table>
            <br />
            <span style={{whiteSpace: 'pre-line'}}>
                <FormattedMessage
                    id={asahiData.summary}
                    defaultMessage={asahiData.summary}
                />
            </span>
        </div>
        <div className={styles.avatar_container}>
            <picture className={styles.avatar_img} >
                <source srcSet={currentImg.img} type="image/webp" />
                <img src={currentImg.imgPng} alt="avatar" />
            </picture>
            <div className={styles.avatar_img_section}>
                {images.map((it, index) => <div key={index} onClick={() => setCurrentImg(it)}>
                    <FormattedMessage
                        id={it.name}
                        defaultMessage={it.name}
                    />
                </div>)}
            </div>
        </div>
    </div>;
}