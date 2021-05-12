import React from "react";
import { PageHeader } from "antd";

// displays a page header

export default function Header() {
  return (
    <a href="https://#" target="_blank" rel="noopener noreferrer">
      <PageHeader
        title="🏗 DAPP Chain"
        subTitle="Decentralized solution for SCM"
        style={{ cursor: "pointer" }}
      />
    </a>
  );
}
