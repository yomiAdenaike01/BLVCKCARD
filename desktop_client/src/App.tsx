import { lazy, Suspense } from "react";
import { BrowserRouter, Redirect, Route } from "react-router-dom";
import Navigation from "./components/navigation/Navigation";
import "react-perfect-scrollbar/dist/css/styles.css";
import PerfectScrollbar from "react-perfect-scrollbar";

const Register = lazy(() => import("./routes/register/Register"));

const App = () => {
  return (
    <main className="flex flex-col w-full h-full">
      <Navigation />
      <Suspense fallback={<span>Hello</span>}>
        <BrowserRouter>
          <PerfectScrollbar>
            <main className="p-4 flex flex-1 w-full">
              <Route component={Register} path="/register" />
            </main>
            <Redirect from="/" to="/register" exact />
          </PerfectScrollbar>
        </BrowserRouter>
      </Suspense>
    </main>
  );
};

export default App;
