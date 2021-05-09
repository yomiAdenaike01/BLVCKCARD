import React from "react";
import { useHistory } from "react-router";

interface Props {}

const Navigation = (props: Props) => {
  const history = useHistory();
  const register = () => {
    history.push("/register");
  };
  return (
    <div className="flex items-center justify-space-between">
      <h3 className="uppercase tracking-wider">Blackboard</h3>
      <div className="flex items-center">
        <p>Login</p>|<p onClick={register}>Register</p>
      </div>
    </div>
  );
};

export default Navigation;
