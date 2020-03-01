import React, { useState } from 'react';
import { Lottie } from '@crello/react-lottie'
import logoAnimation from './logo.json'
import './index.css'

interface IProps {
    callback?: () => void
    completed?: () => void;
}

export const Intro = (props: IProps) => {
    const [called, setCalled] = useState(false);
    return <div className={"intro-container"}>
        <Lottie config={{ animationData: logoAnimation, loop: false }} lottieEventListeners={[
            {
                callback: (e) => {
                    if (e.currentTime > 215 && props.callback && !called) {
                        setCalled(true);
                        props.callback();
                    }
                }, name: 'enterFrame'
            },
            {
                callback: () => {
                    setTimeout(() => {
                        if (props.completed) {
                            props.completed();
                        }
                    }, 200);
                }, name: 'complete'
            },
        ]}></Lottie>
    </div>;
};
