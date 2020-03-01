import React from "react";
import { RouteComponentProps } from "@reach/router";
import { Footer } from "../Footer";
import './index.css';

export const Home = (props: RouteComponentProps) => {
    return <div className="home-container">
        <div>
            home!
        </div>
      <Footer />
    </div>;
}