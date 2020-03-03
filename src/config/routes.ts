import { Home } from "../components/Home";
import { About } from "../components/About";
import { Character } from "../components/Character";
import { Collaboration } from "../components/Collaboration";

export const routes = [
    {
        order: 4,
        display: "About",
        path: "/about",
        Component: About
    },
    {
        order: 3,
        display: "Collaboration",
        path: "/Collaboration",
        Component: Collaboration
    },
    {
        order: 2,
        display: "Character",
        path: "/character",
        Component: Character
    },
    {
        order: 1,
        display: "Top",
        path: "/",
        exact: true,
        Component: Home
    }
];
