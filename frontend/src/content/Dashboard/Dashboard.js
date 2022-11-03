import React, { useState } from 'react';

import {
  Breadcrumb,
  BreadcrumbItem,
  ClickableTile,
  Pagination,
  Tile,
  Grid,
  Column
} from '@carbon/react';

import { SimpleBarChart, DonutChart } from '@carbon/charts-react';

import { CloseFilled, WarningFilled, CheckmarkFilled, VideoChat, Image, Police, Folders, Upload } from '@carbon/react/icons';

import PageSeparator from '../../components/Dashboard/PageSeparator';
import ReportsTable from '../../components/ReportsTable/ReportsTable';
import ReportModal from '../../components/Report/ReportModal';

import header_data from '../../components/Dashboard/header_data';
import dummy_data from '../../components/Dashboard/dummy_data';

import "@carbon/charts/styles.css";

const headerData = header_data;
const rowData = dummy_data.map( x => {
  return {
    ...x,
    id: x.id.toString()
  };
});

const groupCount = (objectArray, property) => {
  let transform = new Map();
  transform = objectArray.reduce(function (acc, obj) {
    let key = obj[property]
    if (!acc[key]) {
      acc[key] = []
    }
    acc[key].push(obj)
    return acc
  }, {});

  let result = [];
  for( let key in transform ) {
    let arraySize = transform[key].length;
    result.push(
      {
        group: key, 
        value: arraySize
      });
  }
  
  return result;
}

const chartStatus = {
  data: groupCount(rowData, 'status'),
  options1: {
    title: "Status",
    axes: {
      left: {
        mapsTo: "group",
        scaleType: "labels"
      },
      bottom: {
        mapsTo: "value"
      }
    },
    height: "220px"
  },
  options2: {
    title: "",
    resizable: true,
    donut: {
      center: {
        label: "Browsers"
      }
    },
    height: "220px"
  }
};

const chartOfficer = {
  data: groupCount(rowData, 'case_officer'),
  options1: {
    title: "Officer",
    axes: {
      left: {
        mapsTo: "group",
        scaleType: "labels"
      },
      bottom: {
        mapsTo: "value"
      }
    },
    height: "220px"
  },
  options2: {
    title: "",
    resizable: true,
    donut: {
      center: {
        label: "Browsers"
      }
    },
    height: "220px"
  }
}

const Dashboard = () => {
  const [totalItems, setTotalItems] = useState(rowData.length);
  const [firstRowIndex, setFirstRowIndex] = useState(0);
  const [currentPageSize, setCurrentPageSize] = useState(5);
  const [modalIsOpen, setModalIsOpen] = useState(false);
  const [selectedIncident, setSelectedIncident] = useState({});

  const editIncidentReport = (i) => {
    let incident = {};

    i.cells.map( x => {
      let id = x.id.split(':')[1];
      incident[id] = x.value;
    });

    setSelectedIncident(incident);
    setModalIsOpen(true);
  }

  const archiveIncidentReport = (i) => {
    console.log(i);
  }

  const closeModal = () => {
    setModalIsOpen(false);
  }

  return (
    <Grid className="dashboard-page" fullWidth>
      <Column lg={16} md={8} sm={4}>
        <Grid className="dashboard-page__banner">
          <Column lg={16} md={4} sm={4}>
            <Breadcrumb noTrailingSlash aria-label="Page navigation">
              <BreadcrumbItem>
                <a href="/">Home</a>
              </BreadcrumbItem>
            </Breadcrumb>
          </Column>
          <Column lg={16} md={4} sm={4}>
            <h1 className="dashboard-page__heading">
              Welcome, <span style={{fontWeight: 'bold'}}>Det. Benson</span>
            </h1>
          </Column>
        </Grid>
        <Grid>
          <Column lg={16} md={8} sm={4} className="dashboard-page__r2">
            <Grid>
              <Column md={4} lg={5} sm={4} className="dashboard-page__card">
                <Tile>
                  <h5 style={{float: 'left', paddingTop: '15px'}}><CloseFilled size={32} fill="red" /></h5>
                  <p>Errors</p>
                  <h3 style={{fontWeight: 'bold'}}>{chartStatus.data[0].value}</h3>
                </Tile>
              </Column>
              <Column md={4} lg={5} sm={4} className="dashboard-page__card">
                <Tile>
                  <h5 style={{float: 'left', paddingTop: '15px'}}><WarningFilled size={32} fill="#D68700" /></h5>
                  <p>Warnings</p>
                  <h3 style={{fontWeight: 'bold'}}>{chartStatus.data[1].value}</h3>
                </Tile>
              </Column>
              <Column md={4} lg={6} sm={4} className="dashboard-page__card">
                <Tile>
                  <h5 style={{float: 'left', paddingTop: '15px'}}><CheckmarkFilled size={32} fill="green" /></h5>
                  <p>Success</p>
                  <h3 style={{fontWeight: 'bold'}}>{chartStatus.data[2].value}</h3>
                </Tile>
              </Column>
            </Grid>
          </Column>
        </Grid>
        <PageSeparator title="Available Sources For Analysis" />
        <Grid>
          <Column lg={16} md={8} sm={4} >
            <Grid>
              <Column md={4} lg={{ span: 3, offset: 0 }} sm={4}>
                <ClickableTile>
                  <VideoChat size={32} aria-label="Videos Uploaded" />
                  <br />
                  Videos Uploaded
                </ClickableTile>
              </Column>
              <Column md={4} lg={3} sm={4}>
                <ClickableTile>
                  <Image size={32} />
                  <br />
                  Photos Uploaded
                </ClickableTile>
              </Column>
              <Column md={4} lg={3} sm={4}>
                <ClickableTile>
                  <Police size={32} />
                  <br />
                  Officer's Bodycam
                </ClickableTile>
              </Column>
              <Column md={4} lg={3} sm={4}>
                <ClickableTile>
                  <Folders size={32} />
                  <br />
                  Officer's Reports
                </ClickableTile>
              </Column>
              <Column md={4} lg={4} sm={4}>
                <ClickableTile>
                  <Upload size={32} />
                  <br />
                  Another Source
                </ClickableTile>
              </Column>
            </Grid>
          </Column>
        </Grid>
        <PageSeparator title="Statistics" />
        <Grid>
          <Column lg={16} md={8} sm={4}>
            <Grid>
              <Column md={4} lg={10} sm={4} style={{float: 'left', border: '1px solid #cccccc'}}>
                <SimpleBarChart
                  data={chartStatus.data}
                  options={chartStatus.options1}
                />
              </Column>
              <Column md={4} lg={6} sm={4} style={{float: 'right', border: '1px solid #cccccc'}}>
                <DonutChart
                  data={chartStatus.data}
                  options={chartStatus.options2}
                />
              </Column>
              <Column md={4} lg={10} sm={4} style={{float: 'left', border: '1px solid #cccccc', marginTop: '1rem', marginBottom: '1rem'}}>
                <SimpleBarChart
                  data={chartOfficer.data}
                  options={chartOfficer.options1}
                />
              </Column>
              <Column md={4} lg={6} sm={4} style={{float: 'right', border: '1px solid #cccccc', marginTop: '1rem', marginBottom: '1rem'}}>
                <DonutChart
                  data={chartOfficer.data}
                  options={chartOfficer.options2}
                />
              </Column>
            </Grid>
          </Column>
        </Grid>
        <PageSeparator title="Reports" />
        <Grid>
          <Column lg={16} md={8} sm={4}>
            <Grid>
              <Column md={4} lg={16} sm={4} style={{marginTop: '1rem', marginBottom: '1rem'}}>
                <Pagination
                  totalItems={totalItems}
                  backwardText="Previous page"
                  forwardText="Next page"
                  pageSize={currentPageSize}
                  pageSizes={[5, 25, 50, 100]}
                  itemsPerPageText="Items per page"
                  onChange={({ page, pageSize }) => {
                    if (pageSize !== currentPageSize) {
                      setCurrentPageSize(pageSize);
                    }
                    setFirstRowIndex(pageSize * (page - 1));
                  }}
                />
                <ReportsTable 
                  headers={headerData}
                  rows={rowData.slice(
                    firstRowIndex,
                    firstRowIndex + currentPageSize
                  )}
                  editIncidentHandler={editIncidentReport}
                  archiveIncidentHandler={archiveIncidentReport}
                />
                {modalIsOpen && <ReportModal modalIsOpen={modalIsOpen} modalCancelHandler={closeModal} incident={selectedIncident} />}
              </Column>
            </Grid>
          </Column>
        </Grid>
      </Column>
    </Grid>
  );
};

export default Dashboard;