import React, { useState } from "react";
import ImageCard from "../../components/ImageCard";
import { DateLib } from "@yomiadenaike/date-lib/dist/date-lib";
import "./register.css";
const form = [
  {
    inputType: "input",
    type: "text",
    label: "resturant name",
  },
  {
    inputType: "textarea",
    type: "text",
    label: "resturant description",
  },
  {
    inputType: "select",
    label: "cuisine",
    options: [],
  },
  {
    inputType: "select",
    label: "dietry",
    options: [],
  },
  {
    label: "average_meal_price",
    inputType: "input",
    type: "number",
  },
  [
    {
      label: "menu_link",
      inputType: "input",
      type: "text",
    },
    {
      label: "website",
      inputType: "input",
      type: "text",
    },
  ],
  {
    label: "address",
    inputType: "textarea",
    type: "text",
  },
  [
    {
      inputType: "input",
      label: "city",
    },
    {
      inputType: "input",
      label: "postcode",
    },
  ],
];

const Register = () => {
  const [state, setstate] = useState({});
  const [imagesState, setImagesState] = useState({
    leadImage: "",
    optional1: "",
    optional2: "",
    optional3: "",
  });
  const _renderFormItem = (x: any): JSX.Element => {
    if (Array.isArray(x)) {
      return <div className="flex items-center w-full">{mapForm(x)}</div>;
    } else {
      let res: JSX.Element = <></>;
      switch (x.inputType) {
        case "input":
          res = (
            <input
              min={1}
              className="input"
              type={x.type}
              placeholder={x.label}
            />
          );
          break;
        case "select":
          res = (
            <select className="select">
              {x.options.map((option: any) => (
                <option value={option.value}>{option.label}</option>
              ))}
            </select>
          );
          break;
        case "textarea":
          res = <textarea className="textarea" />;
          break;
        default:
          break;
      }
      return (
        <div className="flex flex-col input_item">
          <label htmlFor="">{x.label.split("_").join(" ")}</label>
          {res}
        </div>
      );
    }
  };
  const mapForm = (form: any[]): JSX.Element[] => {
    return form.map((x) => _renderFormItem(x));
  };
  const onUpdateImage = (img: string, key: keyof typeof imagesState) => {
    setImagesState((s) => {
      return {
        ...s,
        [key]: img,
      };
    });
  };
  return (
    <div className="register_page flex flex-col w-full h-full">
      <h1 className="uppercase">Add a resturant</h1>

      <main className="flex items-start h-full w-full">
        {/* Form container */}
        <div className="flex-col flex flex-1">{mapForm(form)}</div>
        {/* Images */}
        <div className="flex flex-col">
          <ImageCard
            imgURL={imagesState.leadImage}
            className="bg-gray-100 w-full"
            onUpdateImage={(e) => onUpdateImage(e, "leadImage")}
          >
            <h1>Supports JPEG PNG </h1>
          </ImageCard>
          <div className="flex flex-col">
            <span className="uppercase">add a few more options (optional)</span>
            <div className="flex flex-wrap">
              <ImageCard
                imgURL={imagesState.optional1}
                className="border border-solid border-gray-300"
                onUpdateImage={(e) => onUpdateImage(e, "optional1")}
              />
              <ImageCard
                className="border border-solid border-gray-300"
                imgURL={imagesState.optional2}
                onUpdateImage={(e) => onUpdateImage(e, "optional2")}
              />
              <ImageCard
                className="border border-solid border-gray-300"
                imgURL={imagesState.optional3}
                onUpdateImage={(e) => onUpdateImage(e, "optional3")}
              />
            </div>
          </div>
        </div>
      </main>
      <h1 className="uppercase">Discount</h1>
      {[...Array(7)].map((x, i) => {
        return (
          <div className="input_item flex items-start">
            <span className="capitalize w-36">{DateLib.daysOfWeek[i]}</span>
            <div className="mx-3 flex flex-col">
              <label htmlFor="">Discount</label>
              <div className="input flex items-center justify-between">
                <input type="text" className="w-full" />
              </div>
            </div>
            <div className="flex flex-col items-start">
              <label htmlFor="">Discount notes (optional)</label>
              <input type="text" className="input" />
            </div>
          </div>
        );
      })}
    </div>
  );
};

export default Register;
