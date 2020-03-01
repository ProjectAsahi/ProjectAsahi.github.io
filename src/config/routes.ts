import { Home } from "../components/Home";
import { About } from "../components/About";
import { Biography } from "../components/Biography";

export const routes = [
    {
        order: 3,
        display: "About",
        path: "/about",
        Component: About
    },
    {
        order: 2,
        display: "Biography",
        path: "/biography",
        Component: Biography
    },
    {
        order: 1,
        display: "Home",
        path: "/",
        exact: true,
        Component: Home
    }
];
