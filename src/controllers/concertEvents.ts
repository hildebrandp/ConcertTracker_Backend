import path from 'path';
import { Request, Response } from 'express';

import { getConnection } from '../config/db';
import JSONSchemaValidator from '../utils/JSONSchemaValidator';


const table_name = "ConcertEvents";
const schema_ConcertEvent_FilePath = path.resolve(__dirname, "../types/schemas/ConcertEvent.json");

const validator = new JSONSchemaValidator();

export const get_AllConcertEvents = async (req: Request, res: Response) => {
    let connection;
    try {
        connection = await getConnection();
        const rows = await connection.query(`SELECT * FROM ${table_name}`);
        res.json(rows);
    } catch (error) {
        console.error('Error fetching Concert-Events:', error);
        res.status(500).send('Error fetching Concert-Events');
    } finally {
        if (connection) connection.end();
    }
};

export const get_ConcertEvent_ById = async (req: Request, res: Response) => {
    const { id } = req.params; // Get the 'id' parameter from the request
    let connection;

    if (isNaN(Number(id))) {
        res.status(400).send({ message: 'Invalid ID format' });
        return;
    }

    try {
        connection = await getConnection();
        const query = `SELECT * FROM ${table_name} WHERE id = ?`;
        const rows = await connection.query(query, [id]); // Use parameterized query to prevent SQL injection

        if (rows.length === 0) {
            res.status(404).send({ message: 'Concert-Event not found' });
        }

        res.json(rows[0]); // Send the first result
    } catch (error) {
        console.error('Error fetching Concert-Events:', error);
        res.status(500).send('Error fetching Concert-Events');
    } finally {
        if (connection) connection.end();
    }
};

export const create_ConcertEvent = async (req: Request, res: Response) => {
    const eventData = req.body;

    // Validate the incoming request body
    const isValid = validator.validateObject(eventData, schema_ConcertEvent_FilePath);

    if (!isValid) {
        res.status(400).json({ message: 'Invalid data. See server logs for details.' });
        return;
    }

    const { name,
        datetime,
        venue_id,
        rating,
        notes = null
    } = eventData;

    let connection;

    try {
        connection = await getConnection();

        // Insert the new venue into the database
        const query = `INSERT INTO ${table_name} (name, datetime, venue_id, rating, notes) 
            VALUES (?, ?, ?, ?, ?)`;

        const result = await connection.query(query, [name, datetime, venue_id, rating, notes]);

        // Check if the insert was successful
        if (result.affectedRows === 1) {
            console.log(`Concert-Event created successfully`);
            res.status(201).json({
                message: 'Concert-Event created successfully',
                venueId: result.insertId.toString(), // Return the ID of the newly created record
            });
        } else {
            console.log(`Error: Failed to create Concert-Event`);
            res.status(400).json({ message: 'Failed to create Concert-Event in database' });
        }
    } catch (error) {
        console.error('Error creating Concert-Event:', error);
        res.status(500).json({ message: 'Error creating Concert-Event' });
    } finally {
        if (connection) connection.end();
    }
};

export const update_ConcertEvent_ById = async (req: Request, res: Response) => {
    const { id } = req.params; // Get the ID from the URL
    const eventData = req.body;

    // Validate the incoming request body
    const isValid = validator.validateObject(eventData, schema_ConcertEvent_FilePath);

    if (!isValid) {
        res.status(400).json({ message: 'Invalid data. See server logs for details.' });
        return;
    }

    let connection;

    try {
        connection = await getConnection();

        // Check if the concert venue exists
        const [existingVenue] = await connection.query(
            `SELECT * FROM ${table_name} WHERE id = ?`,
            [id]
        );

        if (!existingVenue) {
            res.status(404).json({ message: `Concert-Event with ID [ ${id} ] not found` });
            return;
        }

        // Update the concert event
        const { name,
            datetime,
            venue_id,
            rating,
            notes = null
        } = eventData;

        const query = `UPDATE ${table_name} SET name = ?, datetime = ?, venue_id = ?, 
            rating = ?, notes = ? WHERE id = ?`;

        const result = await connection.query(query, [name, datetime, venue_id, rating, notes, id]);

        if (result.affectedRows === 1) {
            res.status(200).json({ message: 'Concert-Event updated successfully' });
        } else {
            res.status(400).json({ message: 'Failed to update Concert-Event' });
        }
    } catch (error) {
        console.error('Error updating Concert-Event:', error);
        res.status(500).json({ message: 'Database error' });
    } finally {
        if (connection) connection.end();
    }
};