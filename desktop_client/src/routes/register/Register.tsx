import React, {
  MouseEvent,
  DragEventHandler,
  useEffect,
  useState,
} from "react";
import axios from "axios";
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
  },
  {
    inputType: "select",
    label: "dietry",
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
export const ImageCard = ({ className }: { className?: string }) => {
  const [imageData, setImageData] = useState("");
  const id = Math.random().toString(16).slice(2);

  const onDragOver = (e: React.DragEvent<HTMLDivElement>) => {
    if (e.currentTarget && e.dataTransfer?.getData("image")) {
      const q = (e.currentTarget as HTMLElement).querySelector("img");
      if (q) {
        q.src = e.dataTransfer?.getData("image");
      }
    }
  };
  const onClick = (e: MouseEvent<HTMLDivElement>) => {
    if (e.currentTarget) {
      const i = e.currentTarget.querySelector(
        "input[type=file]"
      ) as HTMLInputElement;
      if (i) {
        i.click();
      }
    }
  };
  return (
    <div
      onDragOver={onDragOver}
      onClick={onClick}
      className={`rounded-md flex flex-col justify-center items-center ${className}`}
    >
      <input
        onClick={(e) => {
          e.stopPropagation();
        }}
        type="file"
      />
      {imageData ? (
        <img alt="image_to_paste" id={id} src={imageData} />
      ) : (
        <span>No image</span>
      )}
    </div>
  );
};
const Register = () => {
  const [state, setstate] = useState({});
  const _renderFormItem = (x: any): JSX.Element => {
    if (Array.isArray(x)) {
      return <>{mapForm(x)}</>;
    } else {
      let res: JSX.Element = <></>;
      switch (x.inputType) {
        case "input":
          res = <input type={x.type} />;
          break;
        case "select":
          res = (
            <select>
              {x.options.map((option: any) => (
                <option value={option.value}>{option.label}</option>
              ))}
            </select>
          );
          break;
        case "textarea":
          res = <textarea />;
          break;
        default:
          break;
      }
      return res;
    }
  };
  const mapForm = (form: any[]): JSX.Element[] => {
    return form.map((x) => _renderFormItem(x));
  };
  return (
    <main className="flex items-start h-full w-full">
      <h1>Add a resturant</h1>
      {/* Form container */}
      <div className="flex-col flex flex-1">{mapForm(form)}</div>
      {/* Images */}
      <div className="flex flex-col">
        <ImageCard />
        <div className="flex  flex-col">
          <span className="uppercase">add a few more options (optional)</span>
          <div className="flex flex-wrap">
            <ImageCard />
            <ImageCard />
            <ImageCard />
          </div>
        </div>
      </div>
    </main>
  );
};

export default Register;
