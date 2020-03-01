import React, { useState } from 'react';
import './App.css';
import { Intro } from './components/Intro';
import { Header } from './components/Header';
import { routes } from './config/routes';
import { Router, Location } from "@reach/router";
import { TransitionGroup, CSSTransition } from "react-transition-group";


const FadeTransitionRouter = (props: any) => (
  <Location>
    {({ location }) => (
      <TransitionGroup className="transition-group">
        <CSSTransition key={location.key} classNames="fade" timeout={300}>
          <Router location={location} className="router">
            {props.children}
          </Router>
        </CSSTransition>
      </TransitionGroup>
    )}
  </Location>
);

const Content = () => {
  return <FadeTransitionRouter primary={false}>
    {routes.map(({ path, Component }) => <Component path={path} />)}
  </FadeTransitionRouter>;
}

export default () => {
  const [introPlayed, setIntroPlayed] = useState(false);
  const [introIsVisible, setIntroIsVisible] = useState(true);
  return <div className={`app ${introIsVisible ? 'app-intro-container' : ''}`}>
    {introIsVisible && <Intro callback={() => setIntroPlayed(true)} completed={() => setIntroIsVisible(false)} />}
    <div className={`content-container ${introPlayed ? 'is-display' : ''}`}>
      <Header />
      <Content />
    </div>
  </div>;
}
