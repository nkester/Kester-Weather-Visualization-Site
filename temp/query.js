const bigquery = require('./client');

export async function queryData() {
  const datasetId = 'my_data';
  const tableId = 'my_table';
  const projectId = 'spatial-subject-313409'

  try {
    const query =
      `SELECT * FROM ${projectId}.${datasetId}.${tableId} WHERE firstName = 'Rabi';`;
    const options = {
      query: query,
    };
    const [job] = await bigquery.createQueryJob(options);
    const [rows] = await job.getQueryResults();

    console.log('Query results:');
    console.log(rows);
  } catch (error) {
    if (error?.errors[0]?.errors) {
      console.error('Error inserting data:', error.errors[0].errors);
    } else if (error?.errors[0]?.message) {
      console.error('Error inserting data:', error.errors[0].message);
    } else {
      console.error('Error inserting data:', error);
    }
  }
}

