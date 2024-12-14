import { Router } from 'express';
import { get_AllConcertVenues, get_ConcertVenue_ById, create_ConcertVenue, update_ConcertVenue_ById } from '../controllers/concertVenues';

const router = Router();

// API routes for Concert-Venues
router.get('/concertVenues', get_AllConcertVenues);
router.get('/concertVenues/:id', get_ConcertVenue_ById);
router.post('/concertVenues/', create_ConcertVenue);
router.put('/concertVenues/:id', update_ConcertVenue_ById);

// API routes for Concert-Participants
// TODO: router.get('/concertParticipants', get_AllConcertVenues);
// TODO: router.get('/concertParticipants/:id', get_ConcertVenue_ById);
// TODO: router.post('/concertParticipants/', create_ConcertVenue);

// API routes for Concert-Bands

// API routes for Concert-Events

// API routes for Event-Bands

// API routes for Event-Participants

export default router;