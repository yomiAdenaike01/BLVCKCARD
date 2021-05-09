import { lazy } from "react";
import { BrowserRouter, Route } from "react-router-dom";
import Navigation from "./components/navigation/Navigation";
const Register = lazy(() => import("./routes/register/Register"));

const App = () => {
  return (
    <main className="flex flex-col">
      <Navigation />
      <BrowserRouter>
        <main className="p-4 flex flex-1 h-[calc(100% - 100px)]">
          <Route component={Register} path="/register" />
        </main>
      </BrowserRouter>
    </main>
  );
};

export default App;
