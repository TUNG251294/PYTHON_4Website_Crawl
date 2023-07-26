import React from "react";
import { Search } from "@mui/icons-material";
import { IconButton,InputBase } from "@mui/material";
import {
  GridToolbarDensitySelector,
  GridToolbarContainer,
  GridToolbarExport,
  GridToolbarColumnsButton,
} from "@mui/x-data-grid";
import FlexBetween from "./FlexBetween";

const DataGridCustomerToolbar = ({ searchText, setSearchText }) => {
  const handleSearchChange = (event) => {
    setSearchText(event.target.value);
  };

  return (
    <GridToolbarContainer>
      <FlexBetween width="100%">
        <FlexBetween>
          <GridToolbarColumnsButton />
          <GridToolbarDensitySelector />
          <GridToolbarExport />
        </FlexBetween>
        <InputBase
          placeholder="Search..."
          value={searchText}
          onChange={handleSearchChange}
        />
        <IconButton>
          <Search />
        </IconButton>
      </FlexBetween>
    </GridToolbarContainer>
  );
};

export default DataGridCustomerToolbar;
