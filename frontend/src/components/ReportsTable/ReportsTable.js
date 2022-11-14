import React from 'react';
import {
  DataTable,
  OverflowMenu,
  OverflowMenuItem,
  TableContainer,
  Table,
  TableHead,
  TableBatchActions,
  TableBatchAction,
  TableRow,
  TableToolbar,
  TableToolbarContent,
  TableToolbarSearch,
  TableSelectAll,
  TableSelectRow,
  TableHeader,
  TableBody,
  TableCell,
} from '@carbon/react';

import { Archive } from '@carbon/react/icons';

const ReportsTable = (props) => {
  const batchArchiveIncidents = (selectedRows) => {
    console.log(selectedRows);
  }

  const editIncident = (i) => {
    props.editIncidentHandler(i);
  }

  const archiveIncident = (i) => {
    props.archiveIncidentHandler(i);
  }

  return (
    <DataTable 
      rows={props.rows}
      headers={props.headers}
      isSortable
      render={({
        rows,
        headers,
        getHeaderProps,
        getRowProps,
        getSelectionProps,
        getToolbarProps,
        getBatchActionProps,
        onInputChange,
        selectedRows,
        getTableProps,
        getTableContainerProps,
        }) => {

          return (
            <TableContainer title={props.title} description={props.description} {...getTableContainerProps()}>
              <TableToolbar {...getToolbarProps()} >
                <TableBatchActions {...getBatchActionProps()}>
                  <TableBatchAction
                    renderIcon={Archive}
                    iconDescription="Archive the selected rows"
                    onClick={() => batchArchiveIncidents(selectedRows)}
                  >
                    Archive
                  </TableBatchAction>
                </TableBatchActions>
                <TableToolbarContent>
                  <TableToolbarSearch 
                    onChange={onInputChange} 
                  />
                </TableToolbarContent>
              </TableToolbar>
              <Table {...getTableProps()}>
                <TableHead>
                  <TableRow>
                    <TableSelectAll {...getSelectionProps()} />
                    {headers.map((header) => (
                      <TableHeader {...getHeaderProps({ header })}>
                        {header.header}
                      </TableHeader>
                    ))}
                    <TableHeader style={{width: '1rem'}} />
                  </TableRow>
                </TableHead>
                <TableBody>
                  {rows.map((row) => (
                    <TableRow key={row.id} {...getRowProps({ row })}>
                      <TableSelectRow {...getSelectionProps({ row })} />
                      {row.cells.map((cell) => (
                        <TableCell key={cell.id}>{cell.value}</TableCell>
                      ))}
                      <TableCell className="cds--table-column-menu">
                        <OverflowMenu flipped size='md' ariaLabel="">
                          <OverflowMenuItem itemText="Edit" onClick={() => editIncident(row)} />
                          <OverflowMenuItem isDelete itemText="Archive" onClick={() => archiveIncident(row)} />
                        </OverflowMenu>
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
          );
        }
      }
    />
  );
};

export default ReportsTable;