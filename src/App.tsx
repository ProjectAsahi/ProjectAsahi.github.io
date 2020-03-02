import React, { useState } from 'react';
import styles from './App.module.css';
import './App.css';
import { Intro } from './components/Intro';
import { Header } from './components/Header';
import { routes } from './config/routes';
import { Router, Location } from "@reach/router";
import { TransitionGroup, CSSTransition } from "react-transition-group";


const FadeTransitionRouter = (props: any) => (
  <Location>
    {({ location }) => (
      <TransitionGroup className={styles.transition_group}>
        <CSSTransition key={location.key} classNames="fade" timeout={300}>
          <Router location={location} className={styles.router}>
            {props.children}
          </Router>
        </CSSTransition>
      </TransitionGroup>
    )}
  </Location>
);

const Content = () => {
  return <FadeTransitionRouter primary={false}>
    {routes.map(({ path, Component }, index) => <Component key={index} path={path} />)}
  </FadeTransitionRouter>;
}

export default () => {
  const [introPlayed, setIntroPlayed] = useState(false);
  const [introIsVisible, setIntroIsVisible] = useState(true);
  return <div className={`${styles.app} ${introIsVisible ? styles.app_intro_container : ''}`}>
    {introIsVisible && <Intro callback={() => setIntroPlayed(true)} completed={() => setIntroIsVisible(false)} />}
    <div className={`${styles.content_container} ${introPlayed ? styles.is_display : ''}`}>
      <Header />
      <Content />
    </div>
  </div>;
}
