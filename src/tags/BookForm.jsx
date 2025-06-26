import { useEffect, useState } from "react";
import axios from "axios";
import { useParams, useNavigate } from "react-router-dom";

let BookForm = () => {
  return (
    <div>
      <h2>도서등록</h2>
      <hr />
      <form>
        도서번호 : <input type="text" />
        <br />
        도서이름 : <input type="text" />
        <br />
        도서가격 : <input type="text" />
        <br />
        도서수량 : <input type="text" />
        <br />
        출판사명 : <input type="text" />
        <br />
        <button>등록</button>
      </form>
    </div>
  );
};

export default BookForm;
