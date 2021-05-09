import React, { useState, MouseEvent, DragEvent } from "react";
import { AiOutlineCamera } from "react-icons/ai";
interface Props {
  className?: string;
  onUpdateImage(img: string): void;
  imgURL: string;
  children?: JSX.Element;
}
const ImageCard = ({ children, imgURL, className, onUpdateImage }: Props) => {
  const id = Math.random().toString(16).slice(2);

  const onDrop = (e: DragEvent<HTMLDivElement>) => {
    if (e.currentTarget && e.dataTransfer?.getData("image")) {
      const q = (e.currentTarget as HTMLElement).querySelector("img");
      if (q) {
        console.log(e.dataTransfer?.files[0].stream());
        onUpdateImage(URL.createObjectURL(e.dataTransfer?.files[0].stream()));
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
  const onChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files) {
      const [f] = [].slice.call(e.target.files);
      onUpdateImage(URL.createObjectURL(f));
    }
  };
  const onDragOver = (e: DragEvent<HTMLDivElement>) => {
    console.log(e);
  };
  return (
    <div
      onDrop={onDrop}
      onDragOver={onDragOver}
      onClick={onClick}
      className={`rounded-md cursor-pointer  h-40 m-2 min-w-[400px]  flex flex-col justify-center items-center ${className}`}
    >
      <input
        style={{
          display: "none",
        }}
        multiple={false}
        accept="image/x-png,image/jpeg"
        onInput={onChange}
        onClick={(e) => {
          e.stopPropagation();
        }}
        type="file"
      />
      {imgURL ? (
        <img
          alt="image_to_paste"
          className="object-cover object-center w-full h-full rounded-md"
          id={id}
          src={imgURL}
        />
      ) : (
        <AiOutlineCamera className="text-5xl text-gray-400" />
      )}
      {children}
    </div>
  );
};
export default ImageCard;
